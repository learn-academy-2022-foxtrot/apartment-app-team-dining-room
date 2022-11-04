import { render } from "@testing-library/react"
import React from "react"
import { BrowserRouter, useNavigate } from "react-router-dom"
import Home from "./Home"

describe("<Home />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(
      <BrowserRouter>
        <Home />
      </BrowserRouter>,
      div
    )
  })
})
