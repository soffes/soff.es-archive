import React from 'react'
import styled from 'styled-components'

const FooterContainer = styled.footer`
  max-width: 640px;
  margin: 0 auto;
  font-size: 0.9em;
  text-align: center;
  margin: 2rem auto;
  color: #aaa;

  a {
    color: #aaa;

    &:hover {
      color: #0881b3;
    }
  }
`

const Footer = (props) => {
  return(
    <FooterContainer>
      <p>© 2017 <a href="/" rel="home">Sam Soffes</a></p>
    </FooterContainer>
  )
}

export default Footer
