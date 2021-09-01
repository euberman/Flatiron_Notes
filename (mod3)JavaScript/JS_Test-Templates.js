JS_Test-Templates.js

// ========================================================================
// ./test/indexTest.js
let circle;
let triangle;
let square;

describe( "Polygon", () => {
  beforeEach( () => polygon = new Polygon( [ 5, 5, 5 ] ))
  it( "has a Polygon class", () => expect( Polygon ).to.exist)
  it( "Polygon has a countSides getter method that returns the number of sides of the polygon", () => expect( polygon.countSides ).to.eq( 3 ))
  it( "Polygon has a perimeter getter that calculates perimeter", () => expect( polygon.perimeter ).to.eq( 15 ))
} )

describe( "Triangle", () => {
  let triangle
  let triangle2
  it( "has a Triangle class", () => expect( Triangle ).to.exist )
  it( "checks for valid triangle", () => {
    triangle = new Triangle( [ 5, 5, 5 ] )
    triangle2 = new Triangle( [ 15, 10, 1 ] )
    expect( triangle.countSides ).to.eq( 3 )
    expect( triangle.isValid ).to.be.true
    expect( triangle2.isValid ).to.be.false
  } )
  it( "has a perimeter getter inherited from Polygon", () => {
    expect( triangle.perimeter ).to.eq( 15 )
    expect( triangle2.perimeter ).to.eq( 26 )
  } )
} )

describe( "Square", () => {
  it( "has a Square class", () => expect( Square ).to.exist )
  it( "has a perimeter getter inherited from Polygon", () => {
    let square = new Square( [ 5, 5, 5, 5 ] )
    expect( square.perimeter ).to.eq( 20 )
  } )
  it( "calculates the area", () => {
    let square = new Square( [ 5, 5, 5, 5 ] )
    expect( square.area ).to.eq( 25 )
  } )
  it( "checks for valid square", () => {
    let square = new Square( [ 5, 5, 5, 5 ] )
    let square2 = new Square( [ 5, 4, 3, 2 ] )
    expect( square.countSides ).to.eq( 4 )
    expect( square.isValid ).to.be.true
    expect( square2.isValid ).to.be.false
  } )
} )

// ========================================================================
// Index.js - Code for test above
class Polygon{
  constructor(sides){
    this.sides = sides
    this.sidesCount = this.sides.length
  }

  get countSides() {
    return this.sides.length;
  }

  get perimeter() {
    let sides = this.sides;
    let parameter = 0;
    for(let i = 0; i < sides.length; i++){
      parameter += sides[i]
    }
    return parameter;
  }
}

class Triangle extends Polygon{
  get isValid(){
    if (this.sides.length !== 3) return false;
    let side1 = this.sides[0];
    let side2 = this.sides[1];
    let side3 = this.sides[2];
    return ((side1 + side2) > side3) && ((side2 + side3) > side1) && ((side1 + side3) > side1);
  }
}

class Square extends Polygon{
  get isValid(){
    if (this.sides.length !== 4) return false;
    let side1 = this.sides[0];
    let side2 = this.sides[1];
    let side3 = this.sides[2];
    let side4 = this.sides[3];
    return ((side1 === side2) && (side1 === side3) && (side1 === side4));
  }

  get area(){
    let side1 = this.sides[0];
    let side2 = this.sides[1];
    return side1 * side2;
  }
}
// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================

// ========================================================================
