import { createContext, useState } from "react"

export const Context = createContext()

const ContextProvider = (props) => {
	const [currentUser, setCurrentUser] = useState({})
	const [loggedIn, setLoggedIn] = useState(false)

	const findMe = () => {
		fetch("/me")
			.then((res) => res.json())
			.then((data) => {
				if (!data.error) {
					setCurrentUser(data)
					setLoggedIn(true)
				} else {
					console.log({ meError: data })
				}
			})
			.catch((err) => console.log({ err }))
	}

	const store = {
		test: "test",
		findMe,
		currentUser,
		setCurrentUser,
		loggedIn,
		setLoggedIn,
	}

	return <Context.Provider value={store}>{props.children}</Context.Provider>
}

export default ContextProvider
