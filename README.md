# fetch-recipe

## Approach & Decision Making Process

### Summary: Include screen shots or a video of your app highlighting its features

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

### Weakest Part of the Project: What do you think is the weakest part of your project?

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

## Other notes

### Endpoints

* All Recipes `/recipes.json`
* Malformed Data `/recipes-malformed.json`
* Empty Data `/recipes-empty.json`

### JSON Structure

|        Key        |  Type  | Required |                            Notes                             |
| :---------------- | :----- | :------- | :----------------------------------------------------------- |
| `cuisine`         | string |   yes    | The cuisine of the recipe.                                   |
| `name`            | string |   yes    | The name of the recipe.                                      |
| `photo_url_large` | string |   no     | The URL of the recipes's full-size photo.                    |
| `photo_url_small` | string |   no     | The URL of the recipes's small photo. Useful for list view.  |
| `uuid`            | string |   yes    | The unique identifier for the recipe. Represented as a UUID. |
| `source_url`      | string |   no     | The URL of the recipe's original website.                    |
| `youtube_url`     | string |   no     | The URL of the recipe's YouTube video.                       |

```json
{
    "recipes": [
        {
            "cuisine": "British",
            "name": "Bakewell Tart",
            "photo_url_large": "https://some.url/large.jpg",
            "photo_url_small": "https://some.url/small.jpg",
            "uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
            "source_url": "https://some.url/index.html",
            "youtube_url": "https://www.youtube.com/watch?v=some.id"
        },
        ...
    ]
}
```
