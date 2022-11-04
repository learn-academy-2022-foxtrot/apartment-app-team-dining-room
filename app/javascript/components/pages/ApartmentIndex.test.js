import { render } from "@testing-library/react"
import React from "react"
import apartments from "../mockApartments"
import ApartmentIndex from "./ApartmentIndex"

describe("<ApartmentIndex />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(<ApartmentIndex apartments={apartments} />, div)
  })
})
