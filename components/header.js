import React from 'react'
import styled from 'styled-components'
import Title from '../components/title'
import Link from 'next/link'

const HeaderContainer = styled.header`
  display: block;
  max-width: 640px;
  margin: 8rem 0 2rem;

  @media all and (max-width: 660px) {
    margin: 5rem 0 3rem;
  }
`

const Header = (props) => {
  return(
    <HeaderContainer>
      <Title>
        <Link href="/"><a rel="home">Hi, I’m Sam.</a></Link>
      </Title>
    </HeaderContainer>
  )
}

export default Header
