//
//  ViewController.swift₩
//  EcoFit
//
//  Created by 겸 on 2022/09/17.
//
import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{

//    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    @IBOutlet var myMap: MKMapView!
    
    let locationManager = CLLocationManager()
    
    let popupVC = popUpVC()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
//        lblLocationInfo1.text=""
        lblLocationInfo2.text=""
        
        locationManager.delegate = self
        
        // 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // 위치 데이터 추적을 위해 사용자에게 승인 요구
        locationManager.requestWhenInUseAuthorization()
        
        // 위치 업데이트 시작
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    
    private func initView() {
          //Tap 제스처
          let tap = UITapGestureRecognizer(target: self, action: #selector(self.didTappedMapView(_:)))
          self.myMap.addGestureRecognizer(tap)
        



      }
    
    func goLocation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double)->CLLocationCoordinate2D{

        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
//    // 핀 설치를 위한 함수
//    func setAnnotation(latitudeValue : CLLocationDegrees,longitudeValue : CLLocationDegrees, delta span :Double, title strTitle:String, subtitle strSubtitle:String){
//
//        let annotation = MKPointAnnotation()
//
//        //annotation의 조정값을 goLocation함수로부터 2D형태로 받아야하는데 이를 위해 goLocation함수를 수정해야한다.
//        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
//
//        // annotation 셋팅 -> 지도
//        annotation.title = strTitle
//        annotation.subtitle = strSubtitle
//        myMap.addAnnotation(annotation)
//    }
    
    // 위치가 업데이트되었을 때 지도에 위치 나타내는 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last //마지막 위치 찾기
        
        //마지막 위치의 위도와 경도값을 통해 goLocation호출 delta값은 작을 수록 지도 확대 1->0.01은 100배 확대
        _=goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue:  (pLocation?.coordinate.longitude)!, delta: 0.002)
        
        //위도와 경도 값을 가지고 위치정보 찾기
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks,error)->Void in
            let pm = placemarks!.first
            let country = pm!.country
            var adress:String = country!
            
            // pm상수에서 지역 값이 존재한다면 adress 문자열에 추가
            if pm!.locality != nil {
                adress += " "
                adress += pm!.locality!
            }
            
            // pm상수에서 도로 값이 존재한다면 adress문자열에 추가
            if pm!.thoroughfare != nil{
                adress += " "
                adress += pm!.thoroughfare!
            }
            
//            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = adress
        })
        //마지막 위치 업데이트 중단
        locationManager.stopUpdatingLocation()
    }
    
}

extension ViewController {
    
    /// 제스처 조작
    @objc
    private func didTappedMapView(_ sender: UITapGestureRecognizer) {
        let location: CGPoint = sender.location(in: self.myMap)
        let mapPoint: CLLocationCoordinate2D = self.myMap.convert(location, toCoordinateFrom: self.myMap)
        
        if sender.state == .ended {
            self.searchLocation(mapPoint)
        }
        
        present(popupVC, animated: true, completion: nil)

    }
    
    /// 하나만 출력하기 위하여 모든 포인트를 삭제
    private func removeAllAnnotations() {
        let allAnnotations = self.myMap.annotations
        self.myMap.removeAnnotations(allAnnotations)
    }
    
    /// 해당 포인트의 주소를 검색
    private func searchLocation(_ point: CLLocationCoordinate2D) {
        let geocoder: CLGeocoder = CLGeocoder()
        let location = CLLocation(latitude: point.latitude, longitude: point.longitude)
        
        // 포인트 리셋
        self.removeAllAnnotations()
        
        geocoder.reverseGeocodeLocation(location) { (placeMarks, error) in
            if error == nil, let marks = placeMarks {
                marks.forEach { (placeMark) in
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longitude)
                    
                    self.lblLocationInfo2.text =
                    """
                    \(placeMark.administrativeArea ?? "")
                    \(placeMark.locality ?? "")
                    \(placeMark.thoroughfare ?? "")
                    \(placeMark.subThoroughfare ?? "")
                    """
                    
                    self.myMap.addAnnotation(annotation)
                }
            } else {
                self.lblLocationInfo2.text = "검색 실패"
            }
        }
    }
}

