import React from 'react'
import styled from 'styled-components'

const AppsContainer = styled.ul`
  margin: 2em auto;
  width: 100%;
  margin: 0 0 1rem;
  display: grid;
  grid-template-columns: auto auto auto auto;
  grid-column-gap: 1rem;
  grid-row-gap: 0.5rem;

  @media all and (max-width: 660px) {
    grid-template-columns: auto auto;
    grid-column-gap: 0;
    grid-row-gap: 0;
    width: auto;
    justify-items: center;
    align-items: center;
  }
`

const Apps = (props) => {
  return(
    <AppsContainer>
      {props.children}
    </AppsContainer>
  )
}

export default Apps
