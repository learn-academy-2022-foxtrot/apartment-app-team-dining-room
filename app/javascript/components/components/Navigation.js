import React from "react"
import { NavLink } from "react-router-dom"
import { Nav, NavItem } from "reactstrap"

const Navigation = ({
  logged_in,
  current_user,
  new_user_route,
  sign_in_route,
  sign_out_route
}) => {
  return (
    <>
      <Nav>
        <NavItem>
          <NavLink to="/" className="nav-link">
            Home
          </NavLink>
        </NavItem>
        <NavItem>
          <NavLink to="/apartmentindex" className="nav-link">
            View Listings
          </NavLink>
        </NavItem>

        {/* Show when LOGGED IN */}
        {logged_in && (
          <>
            <NavItem>
              <a href="/apartmentindex" className="nav-link">
                My Listings
              </a>
            </NavItem>
            <NavItem>
              <a href="/apartmentnew" className="nav-link">
                Create Listing
              </a>
            </NavItem>
            <NavItem>
              <a href={sign_out_route} className="nav-link">
                Sign Out
              </a>
            </NavItem>
          </>
        )}

        {/* only show if NOT  logged in */}
        {!logged_in && (
          <>
            <NavItem>
              <a href={sign_in_route} className="nav-link">
                Sign In
              </a>
            </NavItem>
            <NavItem>
              <a href={new_user_route} className="nav-link">
                Sign Up
              </a>
            </NavItem>
          </>
        )}
      </Nav>
    </>
  )
}

export default Navigation
