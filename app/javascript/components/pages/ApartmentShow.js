import React from "react"
import { useNavigate, useParams } from "react-router-dom"
import apartments from "../mockApartments"

const ApartmentShow = ({ apartments }) => {
  const { id } = useParams()
  const showApartment = apartments?.find((apartment) => apartment.id === +id)
  console.log(showApartment)
  return (
    <>
      <h3>ApartmentShow</h3>

        <div>
          <img src={showApartment?.image} width="500px" />
          {showApartment?.price}
          {showApartment?.street}
          {showApartment?.city}
          {showApartment?.state}
          {showApartment?.bedroom}
          {showApartment?.bathrooms}
          {showApartment?.pets}
          {showApartment?.manager}
          {showApartment?.email}

        </div>
    </>
  )
}

export default ApartmentShow
