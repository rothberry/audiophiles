import React, { useEffect, useContext } from "react"
import { useParams } from "react-router-dom"
import { Context } from "../context/Context"

const UserProfileContainer = () => {
	const { slug } = useParams()
	const { curentUser, findDisplayUser, displayUser } = useContext(Context)

	useEffect(() => {
		findDisplayUser(slug)
	}, [])

	return (
		<>
			<p>the slug from the url is : {slug}</p>
			<p>This is from the fetch {displayUser.username}</p>
		</>
	)
}

export default UserProfileContainer
