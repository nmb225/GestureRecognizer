import UIKit
import SceneKit
import AVFoundation

class SceneKitViewController: UIViewController {
    
    let session: AVCaptureSession = AVCaptureSession()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var scnView: SCNView!
    
    var scnScene: SCNScene!
    //var scnScene = SCNScene(named: "art.scnassets/ship.scn")!
    var cameraNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enableVideoBackground()
        setupView()
        setupScene()
        setupCamera()
        spawnShape()
        
        cameraView.frame = parentView.bounds
        scnView.frame = parentView.bounds
    }
    
    func setupView(){
        scnView.showsStatistics = true
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
    }
    
    func setupScene(){
        scnScene = SCNScene()
        scnView.scene = scnScene
    }
    
    func setupCamera(){
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    func spawnShape(){
        var geometry: SCNGeometry
        
        switch ShapeType.random() {
        case ShapeType.Sphere:
            geometry = SCNSphere(radius: 1.0)
            
        case ShapeType.Pyramid:
            geometry = SCNPyramid(width: 1.0, height: 1.0, length: 1.0)
            
        case ShapeType.Torus:
            geometry = SCNTorus(ringRadius: 1.0, pipeRadius: 0.5)
            
        case ShapeType.Capsule:
            geometry = SCNCapsule(capRadius: 1.0, height: 1.0)
            
        case ShapeType.Cylinder:
            geometry = SCNCylinder(radius: 1.0, height: 1.0)
            
        case ShapeType.Cone:
            geometry = SCNCone(topRadius: 0.0, bottomRadius: 1.0, height: 1.0)
            
        case ShapeType.Tube:
            geometry = SCNTube(innerRadius: 0.5, outerRadius: 1.0, height: 1.0)
            
        default: geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        }
        
        let geometryNode = SCNNode(geometry: geometry)
        scnScene.rootNode.addChildNode(geometryNode)
    }
    
    func enableVideoBackground(){
        session.sessionPreset = AVCaptureSession.Preset.high
        if let device = AVCaptureDevice.default(for: AVMediaType.video) {
            do {
                try session.addInput(AVCaptureDeviceInput(device: device))
            } catch {
                print(error.localizedDescription)
            }
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        
        previewLayer.frame = cameraView.frame
        cameraView.layer.addSublayer(previewLayer)
        
        session.startRunning()
    }
    
}

