import { useContext, useEffect } from "react"
import { Context } from "./context/Context"
import { Routes, Route } from "react-router-dom"
import Home from "./components/Home"
import NavBar from "./components/NavBar"
import Login from "./containers/Login"
import UserProfileContainer from "./containers/UserProfileContainer"

const App = () => {
	const { loggedIn } = useContext(Context)
	return (
		<>
			{loggedIn ? <NavBar /> : null}
			<Routes>
				<Route path="/profile/:slug" element={<UserProfileContainer />} />
				<Route path="/login" element={<Login />} />
				<Route exact path="/" element={<Home />} />
			</Routes>
		</>
	)
}

export default App
