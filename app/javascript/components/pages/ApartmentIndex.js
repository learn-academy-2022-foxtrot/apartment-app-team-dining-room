import React from "react";

const ApartmentIndex = ({ apartments }) => {
  return (
    <div>
      <h3>ApartmentIndex</h3>
          <h1>TEST</h1>
          {apartments.map((apartment, index) => {
            return (
              <div key={index}>
                {apartment.street},{apartment.city},{apartment.state},
                {/* {apartment.manager}, */}
                {/* {apartment.email}, */}
                {apartment.price},{apartment.bedroom},{apartment.bathrooms},
                {/* {apartment.pets}, */}
                <img src={apartment.image} width="400px" />
              </div>
            );
          })}
    </div>
  );
};

export default ApartmentIndex;
