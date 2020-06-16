//
//  PanoramaViewController.swift
//  PanoView
//
//  Created by Muhammad Arif Setyo Aji on 09/06/20.
//  Copyright © 2020 Muhammad Arif Setyo Aji. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import CoreData
import AVFoundation

class PanoramaViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var blinkView: UIView!
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var cameraDSLRLayoutView: UIImageView!
    
    var imgSnapshot: UIImage?
    var resourceImage: String?
    var player: AVAudioPlayer?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraDSLRLayoutView.isHidden = true
        
        navigationController?.navigationBar.isHidden = true
        
        sceneView.delegate = self
        sceneView.showsStatistics = false
        sceneView.allowsCameraControl = false
        
        addPanoView()
        setupPreviewImageView()
        playSound()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Pause the view's session
        sceneView.session.pause()
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func setupPreviewImageView() {
        //previewImageView.layer.masksToBounds = false
        previewImageView.layer.cornerRadius = 8
        previewImageView.layer.shadowColor = UIColor.darkGray.cgColor
        previewImageView.layer.shadowRadius = 5
        previewImageView.layer.shadowOpacity = 0.8
        previewImageView.layer.shadowOffset = CGSize(width: 2, height: 2)
        
    }
    
    
    @IBAction func shutterButtonPressed(_ sender: UIButton) {
        
//        UIView.animate(withDuration: 0.2, animations: {
//            self.blinkView.alpha = 1
//        }) { (finished) in
//            self.blinkView.isHidden = finished
//        }
//
        self.blinkView.alpha = 1
        self.blinkView.isHidden = false
        
        UIView.animate(withDuration: 0.1) {
            self.blinkView.alpha = 0
        }
        
        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, 0)
        self.sceneView.drawHierarchy(in: sceneView.bounds, afterScreenUpdates: true)
        
        imgSnapshot = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        let newImgSnapshot = imgSnapshot?.rotate(radians: .pi/(-2))
        previewImageView.image = newImgSnapshot
        
        let imageItem = Capture(context: context)
        let imgdata = newImgSnapshot!.pngData() as NSData?
        imageItem.image = imgdata as Data?
        
        self.saveItem()
        
        //Save it to the Photos Album
        //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
    }
    
    func saveItem(){
        do {
            try context.save()
            print("Save photos success!")
        } catch {
            print("Error when save image --- \(error)")
        }
    }
    
    
    @IBAction func segmentedControll(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            
            previewImageView.isHidden = false
            cameraDSLRLayoutView.isHidden = true
            
//            cameraView.alpha = 1
//            dslrView.alpha = 0
        } else {
//            cameraView.alpha = 0
//            dslrView.alpha = 1
            cameraDSLRLayoutView.isHidden = false
            previewImageView.isHidden = true
        }
    }
    
    
    // MARK: - ARSCNViewDelgate
    
    func addSphereNode() -> SCNNode {
        
        // Load assets
        guard let image = UIImage(named: "\(resourceImage ?? "")") else {
            fatalError("Failed to load image")
        }

        //Menyediakan sebuah bola dengan radius 1.5 meter
        let sphere = SCNSphere(radius: 1.5) //(radius: 20)
        sphere.firstMaterial!.isDoubleSided = true
        sphere.firstMaterial!.diffuse.contents = image
        sphere.firstMaterial!.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(-1, 1, 1), 1, 0, 0)
        
        let sphereNode = SCNNode(geometry: sphere)
        
        // Berada ditengah-tengah bola, bisa maju/mundur untuk lebih dekat dengan lapisan luar bola
        sphereNode.position = SCNVector3Make(0, 0, 0)
        
        return sphereNode
    }
    
    func addPanoView() {
        
        // Set the scene
        let scene = SCNScene()
        sceneView.scene = scene
        // Call function add Sphere
        let sphereNode = addSphereNode()
        // Add Sphere to Scene
        scene.rootNode.addChildNode(sphereNode)
    }
    
    func playSound() {
        var sound = ""
        if resourceImage!.contains("Nature") {
            sound = "forest"
        } else {
            sound = "restaurant"
        }
        guard let url = Bundle.main.url(forResource: "\(sound)", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }
            
            player.play()
            player.numberOfLoops = -1

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
