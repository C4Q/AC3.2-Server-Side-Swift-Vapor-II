import FluentProvider
import PostgreSQLProvider
import LeafProvider

extension Config {
  public func setup() throws {
    // allow fuzzy conversions for these types
    // (add your own types here)
    Node.fuzzy = [Row.self, JSON.self, Node.self]
    
    try setupProviders()
    try setupPreparations()
  }
  
  public func addRoutes(drop: Droplet) {
    let catController = CatsController()
    catController.addRoutes(drop: drop)
    
    let catPageController = CatPageController(drop: drop)
    catPageController.setupRoutes()
  }
  
  /// Configure providers
  private func setupProviders() throws {
    try addProvider(FluentProvider.Provider.self)
    try addProvider(PostgreSQLProvider.Provider.self)
    try addProvider(LeafProvider.Provider.self)
  }
  
  /// Add all models that should have their
  /// schemas prepared before the app boots
  private func setupPreparations() throws {
    //preparations += [Post.self]
    preparations += [Cat.self]
  }
}
