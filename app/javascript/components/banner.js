import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["What would you like to drink?", "Please scroll down.."],
    typeSpeed: 40,
    loop: true
  });
}

export { loadDynamicBannerText };
