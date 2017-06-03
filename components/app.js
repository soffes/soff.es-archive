import React from 'react'
import styled from 'styled-components'

const AppContainer = styled.li`
  border-radius: 20px;
  display: block;
  height: 120px;
  margin-bottom: 2em;
`

const AppLink = styled.a`
  display: block;
  width: 100px;
  height: 120px;
  line-height: 0;
  margin: 0 auto;
  text-decoration: none;
  border: 0;

  &:hover {
    border: 0;
  }
`

AppLink.defaultProps = {
  target: "_blank"
}


const AppName = styled.span`
  font-family: 'HelveticaNeue', Helvetica, sans-serif;
  font-size: 14px;
  display: block;
  width: 100px;
  height: 10px;
  font-weight: 800;
  text-align: center;
  line-height: 1em;
  padding: 8px 0 0;
  color: #888;
`

const AppIcon = styled.img`
  box-sizing: border-box;
  border-radius: 20px;
  height: 100px;
  width: 100px;
  position: relative;
  z-index: -2;
  box-shadow: 0 0 3px rgba(0, 0, 0, 0.3), inset 0 0 2px rgba(0, 0, 0, 0.5), inset 0 1px 0 rgba(255, 255, 255, 0.25);
`

const App = (props) => {
  return(
    <AppContainer>
      <AppLink href={props.url} title={props.name}>
        <AppIcon src={props.image_url} alt={props.name} />
        <AppName>{props.name}</AppName>
      </AppLink>
    </AppContainer>
  )
}

export default App
