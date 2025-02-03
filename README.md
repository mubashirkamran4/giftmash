# README

## STEPS TO RUN

* Pre-requisites

    * Docker Desktop
    * Docker Compose(docker-compose)

* Start Docker Desktop on your machine.

* Go to terminal and clone the code repo using ssh via command: 
    `git clone git@github.com:mubashirkamran4/giftmash.git`

* Switch to code repo via `cd giftmash`

* Build the docker image:
   ```
     docker-compose build
   ```
* Start the container:
    
    ```
        docker-compose up -d
    ```

* Go inside the container using:
    ```
        docker-compose exec giftmash bash
    ```

* Create the database and run the database migrations inside the container:

    ```
        rails db:create db:migrate
    ```

* Execute the rake task to import the gifts from excel file `db/data/gifts_macroman_to_utf8.csv`:

    ```
        rails gift_importers:import_gifts_from_csv
    ```

* Open the browser and point URL to `http://localhost:3000/` and you would see the 2 random gifts next to each other. 
    * Click Like button under the product you like and it should upvote the liked one, downvote the discarded one and would be saved into db, the page would refresh and you can see another 2 random gifts every time you click like.

    * If you want to skip , click skip button on the bottom right and it would simply do thing with upvotes/downvotes instead would refresh the page and would display you next 2 gifts.

    * If you want to see the Results page where gifts are ordered by upvotes, click the Results page on the top right and that would take you to results table. Clicking on Giftmash on top left would take you back to the home giftsmash page.
    
* To execute the test cases:
    * go to `giftmash_test` container via command: `docker-compose exec giftmash_test bash`
    * run the command `rspec` and it will execute the test cases for gift model and controller present inside `spec/models/gift_spec.rb` and `spec/controllers/gifts_controllers.rb` files.
