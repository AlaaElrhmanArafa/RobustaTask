# RobustaTask

This task for Roboust hiring process, The app is about Displaying GitHub repos list and their Details. 

# Modules: 
 - Repos List
 - Repos Details

# Documentation:

The App implemented using MVVM 
RepoViewModel responsible for parsing Repo
ReposListViewModel responsible for updating list with From API, search 

The "APIServiceProtocol" protcol connect between Network layer and viewModels. 

```
protocol APIServiceProtocol {
    func fetchRepos( complete: @escaping ( _ success: Bool, _ repos: [GitReposResponseElement], _ errorMessage: String? ) -> ())
}
``` 

# Testing
I added Unit tests for search, parsing and different response from API.
