import "bootstrap";

const dota2_button = document.getElementById('dota2');
const csgo_button = document.getElementById('csgo');
const overwatch_button = document.getElementById('overwatch');
const select_cs = document.getElementById('select-cs');
const select_dota2 = document.getElementById('select-dota2');
const select_overwatch = document.getElementById('select-overwatch');
const video_dom = document.getElementById('home-video-wrapper-id');
const backgroundShading = document.querySelector('.game-selector-opaque');
dota2_button.addEventListener("click", (event) => {
    select_dota2.style.display = 'flex';
    select_cs.style.display = 'none';
    select_overwatch.style.display = 'none';
    video_dom.innerHTML = '<video autoplay="autoplay" loop="loop" muted="muted" class="home_video" src="/assets/dota2_blackhole-3f48a411d7c35a2cbaad9a7d84eeccff448863f1ac0459b4f85f95f4521bc40b.mp4"></video>';
    backgroundShading.style.background = 'linear-gradient(to left, #4c57ee, transparent 50%, transparent 75%, rgba(0,0,0,0.9) 77%)';
    dota2_button.style.right = "-40px";
    csgo_button.style.right = "";
    overwatch_button.style.right = "";
 });
csgo_button.addEventListener("click", (event) => {
    select_dota2.style.display = 'none';
    select_cs.style.display = 'flex';
    select_overwatch.style.display = 'none';
    video_dom.innerHTML = '<video autoplay="autoplay" loop="loop" muted="muted" class="home_video" src="/assets/HatefulHauntingAngora-93508f421b20584525f2c4df8e90649fbdb66c3e7571e74950e87feb8dafde21.webm"></video>';
    backgroundShading.style.background = 'linear-gradient(to left, #966c43, transparent 50%, transparent 75%, rgba(0,0,0,0.9) 77%)';
    dota2_button.style.right = "";
    csgo_button.style.right = "-40px";
    overwatch_button.style.right = "";
 });
overwatch_button.addEventListener("click", (event) => {
    select_dota2.style.display = 'none';
    select_cs.style.display = 'none';
    select_overwatch.style.display = 'flex';
    video_dom.innerHTML = '<video autoplay="autoplay" loop="loop" muted="muted" class="home_video" src="/assets/overwatch2-9c4ea83786d80afb249c55ed5e9c0f40a03aed3755c7f81cc1a8326953d70071.mp4"></video>';
    backgroundShading.style.background = 'linear-gradient(to left, purple, transparent 50%, transparent 75%, rgba(0,0,0,0.9) 77%)';
    dota2_button.style.right = "";
    csgo_button.style.right = "";
    overwatch_button.style.right = "-40px";
 });
