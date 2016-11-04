# Personal RSS

A dynamic RSS generator for a few content sources I wanted that lack RSS functionality. Feel free to clone and tweak to your liking.

Contributions/Suggestions welcome!

![demo](http://i.imgur.com/kQ2UhT3.gif)

## Try it out!

1. Add a feed url to a `.env` file. This project uses [dotenv](https://github.com/bkeepers/dotenv) for environment variable management
  ```bash
  $ echo 'FEED_URL=<your url or localhost if not sure>' >> .env
  ```

2. View the available routes using `rake`
  ```bash
  $ rake routes
  ```

3. Run the local server and try out the routes in your browser
  ```bash
  $ rails s
  ```

## Deployment

To connect your personal RSS service to your favorite RSS clients (ex. Feedly), you need to host it somewhere. Different flows are available below

### Heroku

1. Create a heroku project and add the remote to the repository. Instructions [here](https://devcenter.heroku.com/articles/git)
2. Add your heroku project's public url to the production environment
  ```bash
  $ heroku config:set FEED_URL=https://a-dummy-example.herokuapp.com
  ```

3. Deploy it

  ```bash
  $ git push heroku master
  ```

4. Check it out on your browser

## RSS Integration Instructions

Add it to your RSS client once you've hosted it. Instructions by RSS service:

* [Feedly](https://feedly.uservoice.com/knowledgebase/articles/187494-how-to-add-news-feeds-to-your-feedly)

## Current Sources

* HN - powered by [HN Algolia](https://hn.algolia.com)
  * All Popular stories in the last 24 hours that a) gathered over 100 upvotes and b) ranked in the top 20
  * Popular 'Show HN' stories in the last 24 hours with more than 25 votes
* LaunchTicker - HTML version of their twice daily startup news emails. One at 9am PST, another at 5pm
* NYTimes Daily Brief - The Times' daily summary of US/World news
* Crunchbase Daily - HTML version of their once daily email on funding activity
