import { useContext, useEffect } from "react"
import { Context } from "../context/Context"

const App = () => {
	const { currentUser } = useContext(Context)
	return (
		<>
			<p>NAV</p>
			<Routes>
				<Route path="/" element={<Home />}/>
			</Routes>
		</>
	)
}

export default App
