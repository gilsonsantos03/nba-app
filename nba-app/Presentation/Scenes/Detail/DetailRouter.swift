import UIKit

protocol DetailRoutingLogic: AnyObject {

}

final class DetailRouter: DetailRoutingLogic {
    weak var viewController: (UIViewController & DetailDisplayLogic)?
}

