let swiper;

window.addEventListener("load", () => {
  if (document.querySelector('.swiper')) {
    initSwiper();
    initThumbnailEventListeners();
  }
});

function initSwiper() {
  swiper = new Swiper(".swiper", {
    direction: "horizontal",
    loop: true,
    slidesPerView: 1,
    spaceBetween: 10,
    keyboard: {
      enabled: true,
      onlyInViewport: false,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    centeredSlides: true,
    // Disable preloading of all images
    preloadImages: false,
    // Enable lazy loading
    lazy: {
      loadPrevNext: true,
    },
  });

  document
    .querySelector(".js-slideshow-close-button")
    .addEventListener("click", () => {
      document.body.classList.remove("slideshow-open");
    });
}

function initThumbnailEventListeners() {
  const thumbnails = document.querySelectorAll(".js-slideshow-thumbnail");
  thumbnails.forEach((thumbnail) =>
    thumbnail.addEventListener("click", (ev) => {
      document.body.classList.add("slideshow-open");
      const index = ev.currentTarget.dataset.index;
      swiper.slideTo(index, 0);
    })
  );
}
