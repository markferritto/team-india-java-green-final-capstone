<template>
<div>

<div class="container">
    <div class="row">
      
         <div          class="col-sm-4 py-4"
 v-for="revi in reviews" v-bind:key="revi.brewery_id">

<div class="card" style="width: 20rem;">
  <div class="card-body">
    <h4 class="card-title">{{revi.title}}</h4>
        <h4 class="card-title">{{revi.username}}</h4>

    <p class="card-text">{{revi.description}}</p>
  </div>
</div>
          </div>
</div>

</div>


  <div id="addHomeform">

    <form v-on:submit.prevent="submitForm" class="reviewForm">


       <select name="star-rating" v-model="review.stars">
        <option value="">--Please select a star rating</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>

      <div class="form-group">
        <label for="mlsNumber">Description</label>
        <input
          id="mlsNumber"
          type="text"
          class="form-control"
          v-model="review.description"
        />
      </div>

      <div class="form-group">
        <label for="city">Title</label>
        <input
          id="city"
          type="text"
          class="form-control"
          v-model="review.title"
        />
      </div>

      <div class="form-group">
        <label for="state">UserName</label>
        <input
          id="state"
          type="text"
          class="form-control"
          v-model="review.username"
        />
      </div>

      <button class="btn btn-submit">Submit</button>
      <button class="btn btn-cancel" type="cancel">Cancel</button>
    </form> 

  </div>
  </div>
</template>

<script>
import reviewService from "../services/ReviewService.js";



export default {
  name: "add-review",
  name: "App",
  data() {
    return {
      review:{
        description: "",
        stars: 5,
        title: "",
        username: "",
      },
      reviews:[],
      reviewFilter:'',
     
    };
  },
  
  methods: {
    submitForm() {
      //add review by calling reviewService
      reviewService
        .addReview(this.$route.params.id,this.review)
        .then((response) => {
          if (response.status == 201) {
            //route to brewerypage
            this.$router.push("breweries");
          }
        })
        .catch((error) => {
          //handle the error
          console.log(error);
        });
    },
 

  },
   created() {
      reviewService.reviewList(this.$route.params.id).then(response => {
        this.reviews = response.data;
      })
    }
};
</script>

<style scoped>
#addHomeform {
  margin-left: auto;
  margin-right: auto;
  width: 500px;
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
  background-color: #38b412;
  box-shadow: 0 12px 26px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}

.btn-cancel {
  padding: 10px 24px;
  box-shadow: 0 12px 26px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}

.btn-submit:hover {
  color: #fff;
  padding: 10px 24px;
  background-color: #65f307;
  box-shadow: 0 12px 26px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}

.btn-cancel:hover {
  padding: 10px 24px;
  background-color: #65f307;
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


</style>