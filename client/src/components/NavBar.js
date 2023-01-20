import React, { useContext } from "react"
import { Context } from "../context/Context"

const NavBar = () => {
	const { logoutUser, currentUser } = useContext(Context)

	return (
		<div>
			Hello {currentUser.username}!!!
			<button onClick={logoutUser}>LOGOUT</button>
		</div>
	)
}

export default NavBar
