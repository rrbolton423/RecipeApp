### Summary: Include screen shots or a video of your app highlighting its features
RecipeApp/RecipeApp/RecipeApp.mov
https://share.icloud.com/photos/070QcyyQLigu1lr0p25NabEvw

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
Firstly, I wanted to focus on the minimum requirements, displaying each recipe should show its name, photo, and cuisine type. After that was completed, I wanted to go above and beyond by creating a detail view to show more data such as the large recipe image, source url and youtube url in a cool navigation flow, as well as includiong search funcitonality and pull to refresh on the main recipe list screen. I also wanted to focus on caching images, so I included a stack overflow solution called AsyncCachedImage to handle this. Next I prioritized using  Swift concurrency / async await for the network request, as well as including tests to test said network request. I also prioritized not use any third party sdks for this solution, as requested.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I spent approximately four days working on this project. On the first day, I spent time setting up and executing the network request and parsing the data into the Recipe model. On the second day, I spent time creating the RecipeListViewModel and it's business logic to interact with the WebService layer for the fetching of recipes. On the third day I created all of the views for display in the app, and injected the ViewModel into those views in order to display the recipe data. On the fourth day, I added unit tests to test the sample endpoints included in the project. These urls consisted of a valid recipes endpoint, malformed recipes endpoint and empty recipes endpoint.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
I do not feel that I made any significant trade-offs in my approach.

### Weakest Part of the Project: What do you think is the weakest part of your project?
I think the weakest part of the project had to be the tests. While I was able to test the Web Service with three sample endpoints us, I also would have liked to test the RecipeListViewModel. Items from the view model that would have been tested are the various loading states, and the getRecipes() function.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
This was a very fun project from top to bottom and I enjoyed working on it! I am happy to know that this take home project reflects the kind of challenges developers will encounter while working at Fetch. Thank for you the opportunity. - Romell Bolton
