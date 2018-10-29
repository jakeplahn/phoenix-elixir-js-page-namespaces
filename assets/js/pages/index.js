export const heartbeat = () => {console.log("hi from index heartbeat");}
export const moreInfo = (id) => {
  let style = document.body.querySelector("#" + id).style;
  style.display = style.display != "block" ? "block" : "none";
  return false;
};
