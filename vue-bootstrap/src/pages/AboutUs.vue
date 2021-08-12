<template>
  <div>
    <div class="p-5 text-center bg-dark">
      <div id="search-box" class="container">
        <h1 class="title"><h2 class="title">Who are we?</h2></h1>
      </div>
    </div>
    <div class="section section-team text-center">
      <div class="container">
        <h2 class="title">Here is our team</h2>
        <div class="team">
          <div class="row">
            <div class="col-md-6">
              <div class="team-player">
                <img
                  src="img/markpic.jpg"
                  alt="Thumbnail Image"
                  class="rounded-circle img-fluid img-raised"
                />
                <h4 class="title">Mark Ferritto</h4>
                <p class="category text-primary">Full-Stack Developer</p>
                <p class="description">
                  To be explained here
                </p>
                <a href="https://www.linkedin.com/in/markferritto/" class="btn btn-primary btn-icon btn-round"
                  ><i class="fab fa-linkedin"></i
                ></a>
              </div>
            </div>
            <div class="col-md-6">
              <div class="team-player">
                <img
                  src="img/anthonypic.jpg"
                  alt="Thumbnail Image"
                  class="rounded-circle img-fluid img-raised"
                />
                <h4 class="title">Anthony Gautier</h4>
                <p class="category text-primary">Full-Stack Developer</p>
                <p class="description">
                  To be explained here
                </p>
                <a href="https://www.linkedin.com/in/anthonylgautier/" class="btn btn-primary btn-icon btn-round"
                  ><i class="fab fa-linkedin"></i
                ></a>
              </div>
            </div>
            <div class="col-md-6">
              <div class="team-player">
                <img
                  src="img/rumeysapic.jpg"
                  alt="Thumbnail Image"
                  class="rounded-circle img-fluid img-raised"
                />
                <h4 class="title">Rumeysa Ulug</h4>
                <p class="category text-primary">Full-Stack Developer</p>
                <p class="description">
                  To be explained here
                </p>
                <a href="https://www.linkedin.com/in/rumeysa-ulug/" class="btn btn-primary btn-icon btn-round"
                  ><i class="fab  fa-linkedin"></i
                ></a>
              </div>
            </div>
            <div class="col-md-6">
              <div class="team-player">
                <img
                  src="img/johnpic.jpg"
                  alt="Thumbnail Image"
                  class="rounded-circle img-fluid img-raised"
                />
                <h4 class="title">John Hurdle</h4>
                <p class="category text-primary">Full-Stack Developer</p>
                <p class="description">
                  To be explained here
                </p>
                <a href="https://www.linkedin.com/in/john-hurdle/" class="btn btn-primary btn-icon btn-round"
                  ><i class="fab fa-linkedin"></i
                ></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { Button, FormGroupInput } from "@/components";
export default {
  name: "about-us",
  bodyClass: "about-us-page",
  components: {
    [Button.name]: Button,
    [FormGroupInput.name]: FormGroupInput,
  },
  data() {
    return {
      form: {
        firstName: "",
        email: "",
        message: "",
      },
    };
  },
};
</script>

<style scoped>
h2 {
  color: white;
}
h1 {
  color: white;
}
</style>
