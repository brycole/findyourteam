import "bootstrap";


const dota2_button = document.getElementById('dota2');
const csgo_button = document.getElementById('csgo');
const lol_button = document.getElementById('lol');
const select_cs = document.getElementById('select-cs');
const select_dota2 = document.getElementById('select-dota2');
const select_lol = document.getElementById('select-lol');
const video_dom = document.getElementById('home-video-wrapper-id');
dota2_button.addEventListener("click", (event) => {
    select_dota2.style.display = 'block';
    select_cs.style.display = 'none';
    select_lol.style.display = 'none';
    video_dom.innerHTML = '<video autoplay="autoplay" loop="loop" muted="muted" class="home_video" src="/assets/dota2_blackhole-3f48a411d7c35a2cbaad9a7d84eeccff448863f1ac0459b4f85f95f4521bc40b.mp4"></video>';
 });
csgo_button.addEventListener("click", (event) => {
    select_cs.style.display = 'block';
    select_dota2.style.display = 'none';
    select_lol.style.display = 'none';
    video_dom.innerHTML = '<video autoplay="autoplay" loop="loop" muted="muted" class="home_video" src="/assets/HatefulHauntingAngora-93508f421b20584525f2c4df8e90649fbdb66c3e7571e74950e87feb8dafde21.webm"></video>';
 });
lol_button.addEventListener("click", (event) => {
    select_lol.style.display = 'block';
    select_cs.style.display = 'none';
    select_dota2.style.display = 'none';
    video_dom.innerHTML = '<video autoplay="autoplay" loop="loop" muted="muted" class="home_video" src="/assets/lol_group_battle-7c3aa3bc8af662bafa255253b28349eb7f80452303e118b58c84637f55abe39c.mp4"></video>';
 });
