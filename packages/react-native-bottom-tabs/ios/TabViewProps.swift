import SwiftUI

/**
 Props that component accepts. SwiftUI view gets re-rendered when ObservableObject changes.
 */
class TabViewProps: ObservableObject {
  @Published var children: [PlatformView] = []
  @Published var items: [TabInfo] = []
  @Published var selectedPage: String?
  @Published var icons: [Int: PlatformImage] = [:]
  @Published var sidebarAdaptable: Bool?
  @Published var labeled: Bool = false
  @Published var scrollEdgeAppearance: String?
  @Published var barTintColor: PlatformColor?
  @Published var activeTintColor: PlatformColor?
  @Published var inactiveTintColor: PlatformColor?
  @Published var translucent: Bool = true
  @Published var disablePageAnimations: Bool = false
  @Published var hapticFeedbackEnabled: Bool = false
  @Published var fontSize: Int?
  @Published var fontFamily: String?
  @Published var fontWeight: String?
  @Published var tabBarHidden: Bool = false

  var selectedActiveTintColor: PlatformColor? {
    if let selectedPage,
       let tabData = items.findByKey(selectedPage),
       let activeTintColor = tabData.activeTintColor {
      return activeTintColor
    }

    return activeTintColor
  }

  var filteredItems: [TabInfo] {
    items.filter {
      !$0.hidden || $0.key == selectedPage
    }
  }
}
