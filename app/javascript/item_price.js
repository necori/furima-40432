const price = () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

const addTaxDom = document.getElementById("add-tax-price");
addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
console.log(addTaxDom);

const addProfitDom = document.getElementById("profit");
addProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ));
console.log(addProfitDom);
})};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);