import { createContext, useEffect, useState } from "react"

export const Context = createContext()

const ContextProvider = (props) => {
	const [currentUser, setCurrentUser] = useState({})
	const [loggedIn, setLoggedIn] = useState(false)

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
				} else {
					console.log({ logoutErr: data })
				}
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
	}

	return <Context.Provider value={store}>{props.children}</Context.Provider>
}

export default ContextProvider
