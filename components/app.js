import React from 'react'
import styled from 'styled-components'

const AppContainer = styled.li`
  border-radius: 20px;
  display: block;
  height: 120px;
  width: 100px;

  @media all and (max-width: 660px) {
    width: 75px;
  }
`

const AppLink = styled.a`
  display: block;
  width: 100%;
  height: 100%;
  line-height: 0;
  margin: 0 auto;
  text-decoration: none;
  border: 0;
  cursor: pointer !important;

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
  width: 100%;
  height: 10px;
  font-weight: 800;
  text-align: center;
  line-height: 1em;
  padding: 8px 0 0;
  color: #888;

  @media all and (max-width: 660px) {
    font-size: 13px;
  }
`

const AppIcon = styled.img`
  box-sizing: border-box;
  width: 100%;
  position: relative;

  @media all and (max-width: 660px) {
    border-radius: 15px;
  }

  &.App {
    border-radius: 20px;
    box-shadow: 0 0 3px rgba(0, 0, 0, 0.3), inset 0 0 2px rgba(0, 0, 0, 0.5), inset 0 1px 0 rgba(255, 255, 255, 0.25);
  }
`

const App = (props) => {
  return (
    <AppContainer className={props.type}>
      <AppLink href={props.url} title={props.title || props.name}>
        <AppIcon src={props.image_url} alt={props.name} className={props.type} />
        <AppName>{props.name}</AppName>
      </AppLink>
    </AppContainer>
  )
}

export default App
