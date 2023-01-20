import { createContext, useEffect, useState } from "react"
import { useNavigate } from "react-router-dom"

export const Context = createContext()

const ContextProvider = (props) => {
	const [currentUser, setCurrentUser] = useState({})
	const [displayUser, setDisplayUser] = useState({})
	const [loggedIn, setLoggedIn] = useState(false)
	const nav = useNavigate()

	useEffect(() => {
		findMe()
	}, [])

	const findMe = () => {
		fetch("/me")
			.then((res) => res.json())
			.then((data) => {
				console.log("FindMe")
				if (!data.errors) {
					setCurrentUser(data)
					setLoggedIn(true)
					nav("/")
				} else {
					console.log({ meError: data })
				}
			})
			.catch((err) => console.error({ err }))
	}

	const loginUser = (loginData) => {
		const postReqObj = {
			method: "POST",
			headers: {
				"content-type": "application/json",
			},
			body: JSON.stringify(loginData),
		}
		fetch("/login", postReqObj)
			.then((r) => r.json())
			.then((data) => {
				if (!data.errors) {
					setCurrentUser(data)
					setLoggedIn(true)
					nav("/")
				} else {
					console.log({ loginErr: data })
				}
			})
			.catch((err) => console.error({ err }))
	}

	const signupUser = (signupData) => {
		const postReqObj = {
			method: "POST",
			headers: {
				"content-type": "application/json",
			},
			body: JSON.stringify(signupData),
		}
		fetch("/signup", postReqObj)
			.then((r) => r.json())
			.then((data) => {
				if (!data.errors) {
					setCurrentUser(data)
					setLoggedIn(true)
				} else {
					console.log({ signupErr: data })
				}
			})
			.catch((err) => console.error({ err }))
	}

	const logoutUser = () => {
		fetch("/logout", {
			method: "DELETE",
		})
			.then((data) => {
				if (!data.errors) {
					setCurrentUser({})
					setLoggedIn(false)
					nav("/login")
				} else {
					console.log({ logoutErr: data })
				}
			})
			.catch((err) => console.error(err))
	}

	const findDisplayUser = (slug) => {
		fetch("/profile/" + slug)
			.then((r) => r.json())
			.then((data) => {
				console.log(data)
				setDisplayUser(data)
			})
			.catch((err) => console.error(err))
	}

	const store = {
		test: "test",
		findMe,
		currentUser,
		setCurrentUser,
		loggedIn,
		setLoggedIn,
		loginUser,
		logoutUser,
		signupUser,
		findDisplayUser,
		displayUser,
	}

	return <Context.Provider value={store}>{props.children}</Context.Provider>
}

export default ContextProvider
