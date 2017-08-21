import React from 'react'
import styled from 'styled-components'

const AppsContainer = styled.ul`
  max-width: 640px;
  margin-bottom: 3rem;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
  grid-column-gap: 2rem;
  grid-row-gap: 2rem;

  @media all and (max-width: 660px) {
    grid-template-columns: repeat(3, auto);
    grid-column-gap: auto;
    grid-row-gap: 0.5rem;
    width: 100%;
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
