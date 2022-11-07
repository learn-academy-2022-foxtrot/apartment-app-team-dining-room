import { render } from "@testing-library/react"
import React from "react"
import apartments from "../mockApartments"
import ProtectedApartmentIndex from "./ApartmentIndex"

describe("<ProtectedApartmentIndex />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(<ProtectedApartmentIndex apartments={apartments} />, div)
  })
})
