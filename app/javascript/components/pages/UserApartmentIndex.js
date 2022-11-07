import React from "react";

const UserApartmentIndex = ({ apartments, logged_in, current_user }) => {
  console.log("apartments", apartments);
  console.log("current User ID", current_user.id);
  return (
    <div>
      <h3>User's Apartment Index</h3>
      {logged_in && (
        <>
          {apartments.map((apartment, index) => {
            return (
              <div key={index}>
                {current_user.id == apartments[index].id && (
                  <>
                    {apartment.street},{apartment.city},{apartment.state},
                    {/* {apartment.manager}, */}
                    {/* {apartment.email}, */}
                    {apartment.price},{apartment.bedroom},{apartment.bathrooms},
                    {/* {apartment.pets}, */}
                    <img src={apartment.image} width="400px" />
                  </>
                )}
              </div>
            );
          })}
        </>
      )}

      {!logged_in && <h1>Please Log In</h1>}
    </div>
  );
};

export default UserApartmentIndex;
