import { useContext, useState } from "react"
import { Context } from "../context/Context"

const LoginForm = () => {
	const [username, setUsername] = useState("")
	const [password, setPassword] = useState("")
	const { loginUser } = useContext(Context)

	const handleLogin = (e) => {
		e.preventDefault()
		loginUser({ username, password })
	}

	return (
		<form onSubmit={handleLogin}>
			<input
				type="text"
				placeholder="Username"
				value={username}
				onChange={(e) => setUsername(e.target.value)}
			/>
			<input
				type="password"
				placeholder="Password"
				value={password}
				onChange={(e) => setPassword(e.target.value)}
			/>
			<input type="submit" value="Log In" />
		</form>
	)
}

export default LoginForm
