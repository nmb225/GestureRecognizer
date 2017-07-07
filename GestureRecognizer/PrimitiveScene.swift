import SceneKit
import UIKit

class PrimitiveScene: SCNScene {
    
    override init(){
        super.init()
        let sphereGeometry = SCNSphere(radius: 0.2)
        let sphereNode = SCNNode(geometry: sphereGeometry)
        sphereNode.scale = SCNVector3(x: 0.5, y: 0.5, z: 0.5)
        self.rootNode.addChildNode(sphereNode)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
