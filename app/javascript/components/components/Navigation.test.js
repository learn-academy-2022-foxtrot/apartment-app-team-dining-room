import { render, screen } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import React from "react"
import { BrowserRouter } from "react-router-dom"
import Navigation from "./Navigation"

describe("<Navigation />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(
      <BrowserRouter>
        <Navigation />
      </BrowserRouter>,
      div
    )
  })
  it("has clickable links", () => {
    render(
      <BrowserRouter>
        <Navigation />
      </BrowserRouter>
    )
    userEvent.click(screen.getByText("Home"))
    expect(screen.getByText("Home")).toBeInTheDocument()

    userEvent.click(screen.getByText("View Listings"))
    expect(screen.getByText("View Listings")).toBeInTheDocument()
  })
})
