import Header from '../components/header'
import Footer from '../components/footer'
import Section from '../components/section'

const Page = (props) => {
  return(
    <div>
      <Header />
      <Section>
        {props.children}
      </Section>
      <Footer />
    </div>
  )
}

export default Page
