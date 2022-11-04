import React from "react"

const ApartmentIndex = ({ apartments }) => {
  return (
    <div>
      <h3>ApartmentIndex</h3>
      {apartments.map((apartment, index) => {
        return (
            <div key={index}>
            {apartment.street},
            {apartment.city},
            {apartment.state},
            {/* {apartment.manager}, */}
            {/* {apartment.email}, */}
            {apartment.price},
            {apartment.bedroom},
            {apartment.bathrooms},
            {/* {apartment.pets}, */}
            {apartment.image},
            {/* {apartment.user_id} */}
            </div>
        )
      })}

    </div>
  )
}

export default ApartmentIndex
