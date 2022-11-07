import React from "react"
import { useNavigate } from "react-router-dom"

const Home = ({ new_user_route, sign_in_route, logged_in }) => {
  const navigate = useNavigate()
  const handleSubmit = (id) => {
    if (id === "index") {
      navigate("/apartmentindex")
    } else {
      navigate("/userapartmentindex")
    }
  }

  return (
    <div>
      <h1>Welcome!</h1>
      <p>
        lorem ipsum dolor sit amet, consectetur adip lorem ipsum dolor sit amet,
        consectetur adi lorem ipsum dolor sit amet, consectetur adi lorem ipsum
        dolor sit amet, consectetur adi
      </p>

      {/* Show when LOGGED IN */}
      {logged_in && (
        <div>
          <button onClick={() => handleSubmit("user-index")} >My Listings</button>
          <button onClick={() => handleSubmit("index")}>View Listings</button>
        </div>
      )}

      {/* Show when LOGGED OUT */}
      {!logged_in && (
        <div>
          <button>
            <a href={sign_in_route} className="nav-link">
              Sign In
            </a>
          </button>
          <button>
            <a href={new_user_route} className="nav-link">
              Sign Up
            </a>
          </button>
        </div>
      )}
    </div>
  )
}

export default Home
