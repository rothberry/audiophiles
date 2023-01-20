import { useContext, useState } from "react"
import { Context } from "../context/Context"

const SignupForm = () => {
	const [signupData, setSignupData] = useState({
		username: "",
		password: "",
		password_confirmation: "",
		name: "",
		location: "",
		bio: "",
		fb_url: "",
		tw_url: "",
		sc_url: "",
	})
	const { signupUser } = useContext(Context)

	const handleLogin = (e) => {
		e.preventDefault()
		signupUser(signupData)
	}

	const handleChange = (e) => {
		setSignupData((prev) => {
			return {
				...prev,
				[e.target.name]: e.target.value,
			}
		})
	}

	// const { username, password, password_confirmation, bio, name } = signupData

	return (
		<form onSubmit={handleLogin}>
			<input
				type="text"
				placeholder="Username"
				value={signupData.username}
				name="username"
				onChange={handleChange}
			/>
			<br />
			<input
				type="password"
				placeholder="Password"
				value={signupData.password}
				name={"password"}
				onChange={handleChange}
			/>
			<br />
			<input
				type="password"
				name={"password_confirmation"}
				placeholder="Retype Password"
				value={signupData.password_confirmation}
				onChange={handleChange}
			/>
			<br />
			<input
				type="text"
				placeholder="Name"
				name="name"
				value={signupData.name}
				onChange={handleChange}
			/>
			<br />
			<input
				type="text"
				placeholder="Location"
				name="location"
				value={signupData.location}
				onChange={handleChange}
			/>
			<br />
			<textarea
				type="textarea"
				placeholder="Bio"
				name="bio"
				value={signupData.bio}
				onChange={handleChange}
			/>
			<br />
			<input type="submit" value="Sign Up" />
		</form>
	)
}

export default SignupForm
