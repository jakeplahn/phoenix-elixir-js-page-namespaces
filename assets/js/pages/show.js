export const heartbeat = () => {console.log("show heartbeat");};
export const changeColor = () => {
  document.body.querySelector("table").style.color = "red";
  return false
};
