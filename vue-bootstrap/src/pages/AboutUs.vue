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
                <h5>
                  Mark was once a bartender, a rock climbing instructor, and traveled around the US of A before he decided to focus his attention on learning about software development and tricking a rock to think. When he isn't refactoring code he likes to write music, watch movies and cook food for friends and family.
                </h5>
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
                <h5>
                  Former hospitality manager and social worker interested in using creativity in daily problem solving. Dedicated to using coding skills and work ethic to help real people in whatever way possible.
                </h5>
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
                <h5>
                  Hi,I am Rumeysa Ulug,
I truly enjoyed  the time in the Tech Elevator as Java student where I not only learn but also create which makes me feel really excited. Before Tech Elevator I was a Math teacher for nine years and I am thankful for every family who has invited me to be a part of their children’s lives. I will be continuing my journey as a developer who build things human-centered and with creative design.
                </h5>
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
                <h5>
                  Programming made such an impact on me with how it provided a limitless environment that allowed me to express my imagination to create solutions for problems I would never have thought of. Serving in the military gave me the love for working with a team, and with my education from Tech Elevator, I am eagerly searching to be a part of a company that allows me to use my passions to have an impact in the field of tech.
                </h5>
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
