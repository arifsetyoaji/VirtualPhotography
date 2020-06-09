//
//  ViewController.swift
//  PanoView
//
//  Created by Muhammad Arif Setyo Aji on 05/06/20.
//  Copyright © 2020 Muhammad Arif Setyo Aji. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    
    var zoomValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showsStatistics = false
        sceneView.allowsCameraControl = false
        
        addPanoView()
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
    
    
    @IBAction func zoomSlider(_ sender: UISlider) {
        zoomValue = Int(sender.value)
        addPanoView()
    }
    
    
    
    
    // MARK: - ARSCNViewDelgate
    
    func addSphereNode(zoom: Float) -> SCNNode {
        
        // Load assets
        guard let imagePath = Bundle.main.path(forResource: "Hellbrunn25", ofType: "jpg") else {
            fatalError("Failed to find path for panaromic file.")
        }
        guard let image = UIImage(contentsOfFile:imagePath) else {
            fatalError("Failed to load panoramic image")
        }
        
        //Create node, containing a sphere, using the panoramic image as a texture
        //Menyediakan sebuah bola dengan radius 2 meter
        
        let sphere = SCNSphere(radius: 20.0)
        sphere.firstMaterial!.isDoubleSided = true
        sphere.firstMaterial!.diffuse.contents = image
        sphere.firstMaterial!.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(-1, 1, 1), 1, 0, 0)
        
        let sphereNode = SCNNode(geometry: sphere)
        
        // Berada ditengah-tengah bola, bisa maju/mundur untuk lebih dekat dengan lapisan luar bola
        sphereNode.position = SCNVector3Make(0, 0, zoom)
        
        return sphereNode
    }
    
    func addPanoView() {
        
        // Set the scene
        let scene = SCNScene()
        sceneView.scene = scene
        
        // Call function add Sphere
        let sphereNode = addSphereNode(zoom: Float(self.zoomValue))
        
        // Add Sphere to Scene
        scene.rootNode.addChildNode(sphereNode)
    }


}

