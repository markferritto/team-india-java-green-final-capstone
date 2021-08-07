<template>
  <div>
    <div class="page-header page-header-small">
      <parallax
        class="page-header-image"
        style="background-image: url('..//img/bg6.jpg')"
      >
      </parallax>
      <div class="content-center">
        <div class="container">
          <h1 class="title">Beer is what we Love. Let us help you find it.</h1>
          <div>
      <router-link   v-bind:to="{ name: 'breweries' }"><n-button type="primary" size="lg">Find A Brewery</n-button></router-link>&nbsp;|&nbsp;

            <!-- <n-button type="primary" size="lg">Find a Brewery</n-button> -->
          </div>
        </div>
      </div>
    </div>
    <div class="section section-about-us">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto text-center">
            <h2 class="title">Featured Breweries</h2>
            <h5 class="description">
              Ohio is known for many things, but one of the main things is its
              talent for brewing great craft beer. This week, we will be
              featuring breweries from the Columbus area.
            </h5>
          </div>
        </div>
      </div>
    </div>
    <div>
      <div class="section text-center">
        <div>
          <div class="row">
            <div class="col-md-4">
              <div class="team-player">
                <img
                  src="img/brewery1.jpg"
                  alt="Raised Image"
                  class="rounded img-raised"
                />
                <h4 class="title">Seventh Son Brewing Co.</h4>
                <p class="category text-primary">
                  1101 N 4th St, Columbus, OH 43201
                </p>
                <p class="description">
                  Seventh Son Brewing and Antiques on High represent the
                  collective efforts of childhood friends Jen Burton, Travis
                  Spencer, and Collin Castore. Brewmaster Colin Vent joined the
                  team in 2011 and his unique take on craft beer styles and his
                  dedication to quality continue to raise the bar for the
                  Columbus brewing community.
                </p>
                <a
                  href="https://twitter.com/seventhsonbrew?lang=en"
                  target="_blank"
                  class="btn btn-primary btn-icon btn-round"
                  ><i class="fab fa-twitter"></i
                ></a>
                <a
                  href="https://www.instagram.com/seventh_son_brewing/?hl=en"
                  target="_blank"
                  class="btn btn-primary btn-icon btn-round"
                  ><i class="fab fa-instagram"></i
                ></a>
                <a
                  href="https://www.facebook.com/SeventhSonBrewing/"
                  target="_blank"
                  class="btn btn-primary btn-icon btn-round"
                  ><i class="fab fa-facebook-square"></i
                ></a>
              </div>
            </div>
            <div class="col-md-4">
              <div>
                <img
                  src="img/brewery2.jpg"
                  alt="Raised Image"
                  class="rounded img-raised"
                />
                <h4 class="title">Land-Grant Brewing Company</h4>
                <p class="category text-primary">
                  424 W Town St, Columbus, OH 43215
                </p>
                <p class="description">
                  The old factory was built in 1920, and bringing this old
                  building up to snuff was an endeavor; countless blood, sweat,
                  and beers were poured into demo and construction from a cast
                  of amazing folks, namely, Compton Construction and Mode
                  Architects.
                </p>
                <a
                  href="https://twitter.com/landgrantbeer?lang=en"
                  target="_blank"
                  class="btn btn-primary btn-icon btn-round"
                  ><i class="fab fa-twitter"></i
                ></a>
                <a
                  href="https://www.instagram.com/landgrantbrewing/?hl=en"
                  target="_blank"
                  class="btn btn-primary btn-icon btn-round"
                  ><i class="fab fa-instagram"></i
                ></a>
                <a
                  href="https://www.facebook.com/landgrantbrewingco/"
                  target="_blank"
                  class="btn btn-primary btn-icon btn-round"
                  ><i class="fab fa-facebook-square"></i
                ></a>
              </div>
            </div>
            <div class="col-md-4">
              <div>
                <img
                  src="img/brewery3.jpg"
                  alt="Raised Image"
                  class="rounded img-raised"
                />
                <h4 class="title">Columbus Brewing Company</h4>
                <p class="category text-primary">
                  2555 Harrison Rd, Columbus, OH 43204
                </p>
                <p class="description">
                  Columbus Brewing Company is an independent craft brewery
                  dedicated to exploring the flavors of American hops. Best
                  known for Columbus IPA and Bodhi, we also enjoy the subtleties
                  of German-style lagers, the intense characteristics of barrel
                  aged beers and everything in between. We have designed and
                  built our new brewery to make more beer, but also to allow us
                  to explore new frontiers.
                </p>
                <a
                  href="https://twitter.com/ColumbusBrewing"
                  target="_blank"
                  class="btn btn-primary btn-icon btn-round"
                  ><i class="fab fa-twitter"></i
                ></a>
                <a
                  href="https://www.instagram.com/columbusbrewingcompany/?hl=en"
                  target="_blank"
                  class="btn btn-primary btn-icon btn-round"
                  ><i class="fab fa-instagram"></i
                ></a>
                <a
                  href="https://www.facebook.com/columbusbrewing/"
                  target="_blank"
                  class="btn btn-primary btn-icon btn-round"
                  ><i class="fab fa-facebook-square"></i
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
  name: "landing",
  bodyClass: "landing-page",
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

<style>

router-link{
  font-size: 13rem;
  font-weight: 400;
  line-height: 1.5;
  color:white
}
</style>
