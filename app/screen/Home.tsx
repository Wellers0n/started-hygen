
import React, { useState } from "react";
import { graphql, commitMutation } from "react-relay";
import Environment from "../relay/environment";

const Home = ({ history }: RouterProps) => {
  // useState's
  const [state, setState] = useState("");

  // mutation
  const mutation = graphql`
    mutation HomeQuery($input: listMutationInput!) {
      listMutation(input: $input) {
        success
        error
      }
    }
  `;

  const registre = async (e: any) => {
    e.preventDefault();

    commitMutation(Environment, {
      mutation,
      variables: { input: { name, description } },
      onCompleted: (response: HomeQueryResponse, errors: any) => {
        if (errors) return console.log(errors);
        const result = response.listMutation;
        console.log(result)
      },
      onError: (err: string) => console.error(err)
    });
  };

  type ValueChange = {
    value: string;
  };

  type onChangeValue = {
    target: ValueChange;
  };

  return (
    <Container>
      
    </Container>
  );
};

export default Home;

