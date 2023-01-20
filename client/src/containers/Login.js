import React, { useState } from "react"
import LoginForm from "../components/LoginForm"
import SignupForm from "../components/SignupForm"

const Login = () => {
	const [showLogin, setShowLogin] = useState(true)
	const toggleLogin = () => {
		setShowLogin(!showLogin)
	}

	if (showLogin) {
		return (
			<>
				<LoginForm />
				Don't have an account? <button onClick={toggleLogin}>Sign Up</button>
			</>
		)
	} else {
		return (
			<>
				<SignupForm />
				Already have an account? <button onClick={toggleLogin}>Log In</button>
			</>
		)
	}
}

export default Login
