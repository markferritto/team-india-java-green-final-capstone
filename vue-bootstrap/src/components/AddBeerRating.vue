<template>
  <div>
    <div class="header">
      <h1></h1>
      <p>Leave a Review!</p>
    </div>

    <div class="container">
      <div class="main-body">
        <div class="row">
          <div class="col-lg-4">
            <div class="card">
              <div class="card-body">
                <div class="d-flex flex-column align-items-center text-center">
                  <div class="mt-3">
                    <h2>{{ beer.name }}</h2>
                    <h4 class="text-secondary mb-1">{{ beer.description }}</h4>
                    <h4 class="text-muted font-size-sm">
                      abv - {{ beer.abv }}
                    </h4>
                  </div>
                </div>
                <hr class="my-4" />
                <ul class="list-group list-group-flush">
                  <li
                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                  >
                    <h6 class="mb-0">Overall</h6>
                    <span
                      v-for="n in overall"
                      v-bind:key="n.id"
                      class="fa fa-star checked"
                    ></span>
                    <span
                      v-for="n in 5 - overall"
                      v-bind:key="n.id"
                      class="fa fa-star"
                    ></span>
                  </li>
                  <li
                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                  >
                    <h6 class="mb-0">Look&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </h6>
                    <span
                      v-for="n in look"
                      v-bind:key="n.id"
                      class="fa fa-star checked"
                    ></span>
                    <span
                      v-for="n in 5 - look"
                      v-bind:key="n.id"
                      class="fa fa-star"
                    ></span>
                  </li>
                  <li
                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                  >
                    <h6 class="mb-0">Smell&nbsp;&nbsp;&nbsp;&nbsp;</h6>
                    <span
                      v-for="n in smell"
                      v-bind:key="n.id"
                      class="fa fa-star checked"
                    ></span>
                    <span
                      v-for="n in 5 - smell"
                      v-bind:key="n.id"
                      class="fa fa-star"
                    ></span>
                  </li>
                  <li
                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                  >
                    <h6 class="mb-0">Feel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6>
                    <span
                      v-for="n in feel"
                      v-bind:key="n.id"
                      class="fa fa-star checked"
                    ></span>
                    <span
                      v-for="n in 5 - feel"
                      v-bind:key="n.id"
                      class="fa fa-star"
                    ></span>
                  </li>
                  <li
                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                  >


                    <h6 class="mb-0">Tastegi &nbsp;&nbsp;&nbsp;&nbsp;</h6>
                    <span
                      v-for="n in taste"
                      v-bind:key="n.id"
                      class="fa fa-star checked"
                    ></span>
                    <span
                      v-for="n in 5 - taste"
                      v-bind:key="n.id"
                      class="fa fa-star"
                    ></span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-lg-8">
            <div id="breweryReviewForm" class="col-sm">
              <form v-on:submit.prevent="submitForm" class="reviewForm">
                <div class="row">
                  <div class="stars">
                    <form action="">
                      <input
                        class="star star-5"
                        id="star-5"
                        type="radio"
                        name="star"
                        value="5"
                        v-model="review.overall"
                      />
                      <label class="star star-5" for="star-5"></label>
                      <input
                        class="star star-4"
                        id="star-4"
                        type="radio"
                        name="star"
                        value="4"
                        v-model="review.overall"
                      />
                      <label class="star star-4" for="star-4"></label>
                      <input
                        class="star star-3"
                        id="star-3"
                        type="radio"
                        name="star"
                        value="3"
                        v-model="review.overall"
                      />
                      <label class="star star-3" for="star-3"></label>
                      <input
                        class="star star-2"
                        id="star-2"
                        type="radio"
                        name="star"
                        value="2"
                        v-model="review.overall"
                      />
                      <label class="star star-2" for="star-2"></label>
                      <input
                        class="star star-1"
                        id="star-1"
                        type="radio"
                        name="star"
                        value="1"
                        v-model="review.overall"
                      />
                      <label class="star star-1" for="star-1"></label>
                    </form>
                  </div>
                  <div><h5></h5> </div>
                </div>

               <div class="form-group">
              <label for="title">Title</label>
              <input
                id="title"
                type="text"
                class="form-control"
                v-model="review.title"
              />
            </div>

            <div class="name">
              <label for="name">Name</label>
              <input
                id="name"
                type="text"
                class="form-control"
                v-model="review.username"
              />
            </div>

            <div class="form-group">
              <label for="description">Description</label>
              <textarea type="text" class="form-control" v-model="review.description"></textarea>
            </div>

            <button class="btn btn-submit">Submit</button>
            <button
              v-on:click.prevent="resetForm"
              class="btn btn-cancel"
              type="cancel"
            >
              Cancel
            </button>
          </form>
            </div>
            <div class="row">
              <div class="col-sm-11 mx-auto bg-white rounded shadow div">
                <!-- Fixed header table-->
                <div class="table-responsive">
                  <table class="table table-fixed">
                    <tbody>
                      <tr>
                        <th></th>
                        <div
                          class="col-sm-4 py-4"
                          v-for="revi in reviews"
                          v-bind:key="revi.breweryId"
                        >
                          <div class="card" style="width: 30rem">
                            <div class="card-body">
                              <h4>
                                <link
                                  rel="stylesheet"
                                  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
                                />
                                <span
                                  v-for="n in revi.stars"
                                  v-bind:key="n.id"
                                  class="fa fa-star checked"
                                ></span>
                                <span
                                  v-for="n in 5 - revi.stars"
                                  v-bind:key="n.id"
                                  class="fa fa-star"
                                ></span>
                              </h4>
                              <h3 class="card-title">{{ revi.title }}</h3>
                              <h5 class="card-title">-{{ revi.username }}</h5>
                              <h5 class="card-text">
                                {{ revi.description }}
                              </h5>
                            </div>
                          </div>
                        </div>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <!-- End -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import reviewService from "../services/ReviewService.js";
import beerService from "../services/BeerService.js";

export default {
  name: "add-beer-rating",
  data() {
    return {
      value: "",
      review: {
        description: "",
        overall: 0,
        look: 0,
        smell: 0,
        feel: 0,
        taste: 0,
        title: "",
        username: "",
      },
      reviews: [],
      reviewFilter: "",
      beer: {},
      look: 4,
      smell: 3,
      taste: 4,
      feel: 2,
      overall: 5,
    };
  },
  created() {
    reviewService
      .retrieveBeerReviews(this.$route.params.id)
      .then((response) => {
        this.reviews = response.data;
      });
    beerService.retrieveBeerPerId(this.$route.params.id).then((response) => {
      this.beer = response.data;
    });
  },
  methods: {
    submitForm() {
      //add review by calling reviewService
      reviewService
        .addBeerReview(this.$route.params.id, this.beer.beerId, this.review)
        .then((response) => {
          if (response.status == 201) {
            //route to brewerypage
            this.$router.go(0);
          }
        })
        .catch((error) => {
          //handle the error
          console.log(error);
        });
    },
    resetForm() {
      this.review = {
        description: "",
        overall: 0,
        look: 0,
        smell: 0,
        feel: 0,
        taste: 0,
        title: "",
        username: "",
      };
    },
  },
};
</script>

<style scoped>
body {
  background: #f7f7ff;
  margin-top: 20px;
}
.card {
  position: relative;
  display: flex;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #fff;
  background-clip: border-box;
  border: 0 solid transparent;
  border-radius: 0.25rem;
  margin-bottom: 1.5rem;
  box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%),
    0 2px 6px 0 rgb(206 206 238 / 54%);
}
.me-2 {
  margin-right: 0.5rem !important;
}

.main-body {
  padding-top: 100px;
}

#breweryReviewForm {
  margin-left: auto;
  margin-right: auto;
  width: 800px;
}
form input {
  width: 100%;
}

.reviewForm {
  padding: 10px;
  margin-bottom: 10px;
}

.form-group {
  margin-bottom: 10px;
  margin-top: 10px;
}

.form-control {
  display: flex;
  align-items: flex-start;
  width: 100%;
  height: 30px;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #495057;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
}
textarea.form-control {
  height: 75px;
  font-family: Arial, Helvetica, sans-serif;
}
select.form-control {
  width: 20%;
  display: inline-block;
  margin: 10px 20px 10px 10px;
}

.btn-submit {
  color: #fff;
  padding: 10px 24px;
  box-shadow: 0 12px 26px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
  margin-right: 25px;
}

.btn-cancel {
  padding: 10px 24px;
  box-shadow: 0 12px 26px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}

.btn-submit:hover {
  color: #fff;
  padding: 10px 24px;
  background-color: rgb(231, 157, 83);
  box-shadow: 0 12px 26px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}

.btn-cancel:hover {
  padding: 10px 24px;
  background-color: rgb(231, 157, 83);
  box-shadow: 0 12px 26px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}

.status-message {
  display: block;
  border-radius: 5px;
  font-weight: bold;
  font-size: 1rem;
  text-align: center;
  padding: 10px;
  margin-bottom: 10px;
}

.status-message.success {
  background-color: #90ee90;
}

.status-message.error {
  background-color: #f08080;
}

.checked {
  color: orange;
}

body {
  background-color: #eee;
}

div.stars {
  width: 270px;
  display: inline-block;
}

.mt-200 {
  margin-top: 200px;
}

input.star {
  display: none;
}

label.star {
  float: right;
  padding: 10px;
  font-size: 36px;
  color: #4a148c;
  transition: all 0.2s;
}

input.star:checked ~ label.star:before {
  content: "\f005";
  color: #fd4;
  transition: all 0.25s;
}

input.star-5:checked ~ label.star:before {
  color: #fe7;
  text-shadow: 0 0 20px #952;
}

input.star-1:checked ~ label.star:before {
  color: #f62;
}

label.star:hover {
  transform: rotate(-15deg) scale(1.3);
}

label.star:before {
  content: "\f006";
  font-family: FontAwesome;
}

.table-fixed tbody {
  height: 700px;
  overflow-y: auto;
  width: 100%;
}

.table-fixed thead,
.table-fixed tbody,
.table-fixed tr,
.table-fixed td,
.table-fixed th {
  display: block;
}

.table-fixed tbody td,
.table-fixed tbody th,
.table-fixed thead > tr > th {
  float: left;
  position: relative;
}

.title {
  text-align: center;
}

td {
  align-content: center;
}

/* Style the body */
body {
  font-family: Arial;
  margin: 0;
}

/* Header/Logo Title */
.header {
  padding: 10px;
  text-align: center;
  background: rgb(136, 51, 25);
  color: white;
  font-size: 30px;
}

.container {
  padding-bottom: 100px;
}
</style>