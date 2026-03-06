
// swapping two numbers
let a = 5, b = 10;
// let temp = a;
// a=b;
// b=temp;
// console.log("a:", a, "b:", b);

[a,b] = [b, a];
console.log("a:", a, "b:", b);




// square function

function square(n) {
  return n * n;
}

for (let i = 1; i <= 10; i++) {

  console.log( square(i));
}





// find the largest number in an array

 let arr = [1,2,3,4,5,6,17];


 let largest = arr[0];

for (let i = 0; i < arr.length; i++) {

  if (arr[i] > largest) {

    largest = arr[i];
  }
}


console.log("the largest number is ", largest);
